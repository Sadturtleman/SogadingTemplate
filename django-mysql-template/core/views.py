from django.http import HttpResponse
from django.db import connection

def index(request):
    try:
        with connection.cursor() as cursor:
            cursor.execute('SELECT NOW()')
            row = cursor.fetchone()
            now = row[0] if row else 'no-db'
        return HttpResponse(f"<h1>Django + MySQL</h1><p>DB OK - server time: {now}</p>")
    except Exception as e:
        return HttpResponse(f"<h1>DB connection error</h1><pre>{e}</pre>", status=500)
