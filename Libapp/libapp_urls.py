from django.contrib import admin
from  Libapp.views import *
from django.urls import  path

urlpatterns = [
    path('login/',login_web_view,name="login_webview"),
    path('logout/', logout_web_view,name="logout_webview"),
    path('search-results/',library_search_page,name="login_webview"),
    path('wishlist/',library_mywish_list_page,name="login_webview"),
    path('staff/',library_view_for_staff,name="login_webview"),
    path('search-staff-results/',library_view_for_staff,name="login_webview"),
    path('staff/result-submit/',library_view_for_staff,name="login_webview"),
    path('staff/report/',generate_report_library_books,name="login_webview"),
    path('staff/report-export/',generate_report_library_books,name="login_webview"),
    ]