from rest_framework import serializers
from .models import Users
from .models import Entries


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ("name", "email")

class EntriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Entries
        fields = ("type", "amount")
