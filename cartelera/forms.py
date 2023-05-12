from django import forms
from .models import Pelicula

class CarteleraForm(forms.ModelForm):

    class Meta:
        model = Pelicula
        fields = "__all__"