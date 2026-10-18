#!/usr/bin/env python3
import os
print("=" * 40)
print("DevOps Student Application")
print("=" * 40)
print(f"Name:    {os.getenv('STUDENT_NAME', 'Laura')}")
print(f"Surname: {os.getenv('STUDENT_SURNAME', 'Nysanbekova')}")
print(f"Group:   {os.getenv('STUDENT_GROUP', 'IT2-2309')}")
print(f"ID:      {os.getenv('STUDENT_ID', '37962')}")
print("=" * 40)
print("Application is running successfully!")
