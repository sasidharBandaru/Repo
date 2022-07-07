from django.db import models

# Create your models here.
from django.contrib.auth.models import User


class Library_Data(models.Model):

    book_id = models.BigIntegerField(null=True, blank=True)
    isbn_id = models.CharField(max_length=200,null=True,blank=True)
    authors = models.CharField(max_length=200,null=True,blank=True)
    publication_year = models.CharField(max_length=200,null=True,blank=True)
    title = models.CharField(max_length=200,null=True,blank=True)
    language = models.CharField(max_length=100,null=True,blank=True)
    amazon_id = models.CharField(max_length=100,null=True,blank=True)
    amazon_link = models.CharField(max_length=200,null=True,blank=True)

    class Meta:
        db_table = 'library_book_details'


class Library_User_Data(models.Model):

	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='phase_one_v2')
	book_id =models.BigIntegerField(null=True, blank=True)
	notify_me = models.CharField(max_length=20,null=True,blank=True)
	add_remove = models.CharField(max_length=20,null=True,blank=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	class Meta:
		db_table = 'library_user_details'


class Library_Staff_Data(models.Model):

	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='phase_one_v3')
	book_id =models.BigIntegerField(null=True, blank=True)
	availability = models.CharField(max_length=20,null=True,blank=True)
	book_given_date = models.CharField(max_length=200,null=True,blank=True)
	book_submission_date = models.CharField(max_length=200,null=True,blank=True)

	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	class Meta:
		db_table = 'library_staff_details'



class Library_Staff_information(models.Model):

	user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='phase_one_v4')
	staff_flag =models.NullBooleanField(blank=True, null=True)


	class Meta:
		db_table = 'library_staff_information'