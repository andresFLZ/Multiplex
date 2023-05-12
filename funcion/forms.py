from django import forms
from .models import Funcion

class FuncionForm(forms.ModelForm):

    class Meta:
        model = Funcion
        fields = "__all__"