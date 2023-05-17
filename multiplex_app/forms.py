from django import forms
from .models import Cine

class CineForm(forms.ModelForm):

    class Meta:
        model = Cine
        fields = "__all__"