from django import forms
from .models import Snack

class SnackForm(forms.ModelForm):

    class Meta:
        model = Snack
        fields = "__all__"