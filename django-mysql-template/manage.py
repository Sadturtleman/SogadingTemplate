#!/usr/bin/env python
import pymysql
pymysql.version_info = (1,4,3, "final", 0)
pymysql.install_as_MySQLdb()

import os
import sys

def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')
    from django.core.management import execute_from_command_line
    execute_from_command_line(sys.argv)

if __name__ == '__main__':
    main()
