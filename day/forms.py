from django import forms

class FileUploadForm(forms.Form):
    execontent = forms.CharField(max_length=1024)
    date1 = forms.CharField(max_length=256)
    date2 = forms.CharField(max_length=256)
    push = forms.BooleanField()
    file = forms.FileField()