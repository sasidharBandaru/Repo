from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect
from .models import *
from django.db.models import Q
from datetime import date, datetime
import sys,smtplib
from email.mime.text import MIMEText
import os
import pandas as pd
from django.http import HttpResponse,Http404

# Create your views here.
def login_web_view(request):
	title = 'Library - Login'
	if request.method=='POST':
		username = request.POST.get('username', None)
		passwd = request.POST.get('password', None)
		
		username = username.lower().strip() if username else None
		user = authenticate(username=username, password=passwd)
		
		status_staff_obj = Library_Staff_information.objects.filter(user_id=user.id, staff_flag=True)
		if status_staff_obj.exists():
			redirect_to = '/library/staff/'
		else:
			redirect_to = '/'
	
		if user and user.is_active:
			login(request, user)
			return HttpResponseRedirect(redirect_to)
		else:
			return  render(request, 'login_template.html', locals())
	else:
		return  render(request, 'login_template.html', locals())


def logout_web_view(request):
	logout(request)
	return HttpResponseRedirect('/library/login/')

def get_user_added_data(post_data, user_id, Flag, book_id_li):
	
	book_dict, add_book_li ={}, []
	for key,val in post_data.lists():
		
		if str(key)=='csrfmiddlewaretoken' or str(key) == 'show_flag'  :
			continue

		key_id  = key.split('_')
		book_id = int(key_id[1])
		add_book_li.append(book_id)
		book_dict[book_id] = val[0]

	if book_id_li:
		add_book_li = set(book_id_li) - set(add_book_li)
	else:
		add_book_li = add_book_li
	for book_id in add_book_li:
		status_obj = Library_User_Data.objects.filter(book_id=book_id, user_id = user_id )
		value = book_dict.get(book_id,'')
	   	
		if status_obj.exists():
			if Flag == 'add_remove':
				status_obj.update(add_remove='on')
				status_obj.update(notify_me='')
			else:
				status_obj.update(notify_me=value)
				status_obj.update(add_remove='')
			status_obj[0].save()
		else:

			status_obj = Library_User_Data.objects.create(book_id=book_id, user_id = user_id)
			if Flag == 'add_remove':
				status_obj.add_remove='on'
				status_obj.notify_me=''
			else:
				status_obj.notify_me=value
				status_obj.add_remove=''
			status_obj.save()




def library_search_page(request):

	title ="Search Page"
	user_id=request.user.id
	status_staff_obj = Library_Staff_information.objects.filter(user_id=user_id, staff_flag=True)
	
	if status_staff_obj.exists():
		return HttpResponseRedirect('/library/staff/')

	get_data=request.GET
	search_value = get_data.get('q', '')
	lib_obj = []
	show_flag = False
	if search_value:
		show_flag = True
		lib_obj = Library_Data.objects.filter(Q(authors__icontains=search_value) | Q(title__icontains=search_value)).values().order_by('-id')
	
	staff_data = Library_Staff_Data.objects.filter(availability='on')

	staff_dict = {}
	for row in staff_data:
		staff_dict[row.book_id] = row.availability
	print(staff_dict)
	for row in lib_obj:
		row['availability'] = staff_dict.get(row['book_id'],'')
	post_data=request.POST
	
	if post_data:
		user_id = User.objects.get(id=request.user.id)
		get_user_added_data(post_data, user_id, 'notify_me', [])

	return render(request, 'lib_search_template.html', locals())

def get_my_wishlist_data(user_id):

	status_obj = Library_User_Data.objects.filter(user_id = user_id, notify_me='on')
	book_id_li = []
	notify_dict ={}
	for row in status_obj:
		book_id_li.append(row.book_id)
		notify_dict[row.book_id] = [row.notify_me, row.add_remove] 

	lib_obj = Library_Data.objects.filter(book_id__in=book_id_li).values().order_by('-id')

	lib_obj_li = []

	for row in lib_obj:
		row['notify_me'] = notify_dict[row['book_id']][0]
		row['add_remove'] = notify_dict[row['book_id']][1]
		lib_obj_li.append(row)

	return lib_obj_li, book_id_li

def library_mywish_list_page(request):
	title = " My WhishList"
	user_id = User.objects.get(id=request.user.id)

	lib_obj_li, book_id_li = get_my_wishlist_data(user_id)

	post_data = request.POST
	print(post_data)
	if post_data:
		user_id = User.objects.get(id=request.user.id)
		print("-----sas----------")
		get_user_added_data(post_data, user_id, 'add_remove', book_id_li)

		lib_obj_li, book_id_li = get_my_wishlist_data(user_id)

	return render(request, 'lib_mywish_list_template.html', locals())




def get_staff_added_data(post_data, user_id):
	
	book_dict ={}
	for key,val in post_data.lists():
		
		if str(key)=='csrfmiddlewaretoken' or str(key) == 'show_flag'  :
			continue

		key_id  = key.split('@')
		book_id = int(key_id[1])
		if book_id not in book_dict:
			book_dict[book_id] = {}
		if str(key_id[0]) == 'book_submission_date':
			book_dict[book_id]['book_submission_date'] = val[0]
		elif str(key_id[0]) == 'book_given_date':
			book_dict[book_id]['book_given_date'] = val[0]
		elif str(key_id[0]) == 'availability':
			book_dict[book_id]['availability'] = val[0]
	print(book_dict)
	book_id_li =[]
	for book_id in book_dict:
		book_data  = book_dict[book_id]
		status_obj = Library_User_Data.objects.filter(book_id=book_id)
		
		if book_data.get('availability','') == 'on':
			book_id_li.append(book_id)
		   
		if status_obj.exists():

			status_obj = Library_Staff_Data.objects.filter(book_id=book_id)
			status_obj.update(book_submission_date=book_data.get('book_submission_date',''))
			status_obj.update(user_id=user_id)
			status_obj.update(book_given_date=book_data.get('book_given_date',''))
			status_obj.update(availability=book_data.get('availability',''))
			status_obj[0].save()

		return book_id_li

def sent_email_for_available(name, book_name):

	body="<html><body><p>Hi "+name+",</p><p>Your Book "+book_name+" is available Now</p><p>Thanks,</p><p>Library.</p></body></html>"

	subject='Your Book '+ book_name +'is available Now - '
	mail_details = body
	msg = MIMEText(mail_details,'html')
	FROM= "lib@lib.com"
	TO=['sasidharban051@gmail.com']
	msg['Subject'] = subject
	msg['From'] = "lib@lib.com"
	msg['To'] = ",".join(TO)

	session = smtplib.SMTP('localhost', port=1025)

	h=session.sendmail(FROM,TO,msg.as_string())
	print(h)
	session.quit()

def library_view_for_staff(request):

	title ="Search Page"
	# lib_obj = Library_Data.objects.all().order_by('-id')
	get_data=request.GET
	search_value = get_data.get('q', '')
	lib_obj = []
	show_flag = False
	if search_value:
		show_flag = True
		lib_obj = Library_Data.objects.filter(Q(authors__icontains=search_value) | Q(title__icontains=search_value)).values().order_by('-id')
	post_data=request.POST
	if post_data:
		user_id = User.objects.get(id=request.user.id)
		book_id_li = get_staff_added_data(post_data, user_id)

		usr_obj = User.objects.all().values()
		user_dict = {}

		for row in usr_obj:
			user_dict[str(row['username'])] = row['first_name']


		lib_obj = Library_Data.objects.all()

		book_dict = {}

		for row in lib_obj:
			book_dict[row.book_id] = row.title


		users_book_data = Library_User_Data.objects.filter(book_id__in=book_id_li)



		for book_d in users_book_data:
			# print(book_d.user_id, "-------")
			usr_data = user_dict[str(book_d.user_id)]
			name = usr_data
			book_name = book_dict[book_d.book_id]

			sent_email_for_available(name, book_name)

	return render(request, 'lib_page_for_staff_template.html', locals())

 

def generate_report_library_books(request):

	title ="Books - Report"
	staff_submision_data = Library_Staff_Data.objects.all().exclude(availability='on')
	staff_submision_data = staff_submision_data.exclude(book_given_date=None).exclude(book_given_date='')
	book_details = Library_Data.objects.all()

	book_dict={}

	for row in book_details:
		book_dict[row.book_id] = row

	report_book_li = []
	today_time_date = datetime.now()
	for row in staff_submision_data:
		book_given_date = datetime.strptime(str(row.book_given_date)[:10], '%Y-%m-%d')
		get_diff_days = (today_time_date - book_given_date).days
		book_data = book_dict.get(row.book_id)
		book_li = [book_data.book_id, book_data.title, get_diff_days]

		report_book_li.append(book_li)
		file_name = 'report_name.xlsx'
	if '/report-export/' in request.path:

		file_path = '/tmp/'	+file_name
		header = ['	Book ID', 'Book Title', 'No. of Days']
		df = pd.DataFrame(columns = header)
		writer = pd.ExcelWriter(file_path, engine='xlsxwriter')
		for book_li in report_book_li:
			df.loc[len(df), :] = book_li
		sheet_name = 'Books Report'
		df.to_excel(writer, sheet_name=sheet_name, startrow=1, header=False, index=False)

		workbook  = writer.book
		worksheet = writer.sheets[sheet_name]
		header_format = workbook.add_format({
		'bold': True,
		'text_wrap': True})

		worksheet.set_column('A:Z',20)

		merge_format = workbook.add_format({'align': 'center', 'valign': 'vcenter', 'bold': True})

		worksheet.set_row(0,30)
		for col_num, value in enumerate(df.columns.values):

			worksheet.write(0, col_num , value, header_format)
		worksheet.freeze_panes(1, 0)

		writer.save()
		print_file_name = "Book - Report.xlsx"
		if os.path.exists(file_path):
			with open(file_path, 'rb') as fh:
				response = HttpResponse(fh.read(), content_type="mimetype='application/ms-excel'")
				response['Content-Disposition'] = 'attachment; filename='+ print_file_name 
				return response
		else:
			raise Http404
	        



	return render(request, 'lib_generate_reports_template.html', locals())