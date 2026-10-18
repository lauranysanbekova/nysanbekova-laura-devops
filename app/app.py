#!/usr/bin/env python3
import os
from datetime import datetime


def get_student_info():
    return {
        "name": os.getenv("STUDENT_NAME", "Laura"),
        "surname": os.getenv("STUDENT_SURNAME", "Nysanbekova"),
        "group": os.getenv("STUDENT_GROUP", "IT2-2309"),
        "student_id": os.getenv("STUDENT_ID", "37962"),
    }


def main():
    info = get_student_info()
    print("=" * 40)
    print("DevOps Student Application")
    print("=" * 40)
    print(f"Name:    {info['name']}")
    print(f"Surname: {info['surname']}")
    print(f"Group:   {info['group']}")
    print(f"ID:      {info['student_id']}")
    print("=" * 40)
    print(f"Current time: {datetime.now():%Y-%m-%d %H:%M:%S}")
    print("Application is running successfully!")


if __name__ == "__main__":
    main()
