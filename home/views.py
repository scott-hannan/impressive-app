from django.shortcuts import render

# Create your views here.
def display_nodes(request):
    return render(request, 'nodes.html', {'data': "SOME NODE"})

def display_pods(request):
    return render(request, 'pods.html', {'data': "SOME_PODS"})