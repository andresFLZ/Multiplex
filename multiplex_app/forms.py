from django import forms
from .models import Cine
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class CineForm(forms.ModelForm):

    class Meta:
        model = Cine
        fields = "__all__"

class CustomUserCreationForm(UserCreationForm):
	
	class Meta:
		model = User
		fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']