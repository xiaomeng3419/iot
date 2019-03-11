from django.db import connection
# Create your tests here.

if __name__ == '__main__':
    cursor = connection.cursor()
    cursor.execute("select * from blog_blog")
    raw = cursor.fetchone()
    print(raw)
