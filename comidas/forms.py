from django import forms
from .models import Snack

class ComidasForm(forms.ModelForm):

    class Meta:
        model = Snack
        fields = "__all__"