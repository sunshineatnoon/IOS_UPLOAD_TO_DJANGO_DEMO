# -*- coding: utf-8 -*-

from myproject.myapp.models import Document
from myproject.myapp.forms import DocumentForm
from django.http import HttpResponse
import json
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

def list(request):
    # Handle file upload
    if request.method == 'POST':
        form = DocumentForm(request.POST, request.FILES)
        if form.is_valid():
            newdoc = Document(docfile=request.FILES['docfile'])
            newdoc.save()

            # Redirect to the document list after POST
            return HttpResponse(json.dumps({"Status": 0,"ImgName": newdoc.docfile.url}, sort_keys=True))
        else:
            return HttpResponse(json.dumps({"Status": 1}, sort_keys=True))
