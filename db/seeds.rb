# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Member.create(
    name: "太郎",
    birthday: "1998-01-01",
    profile: "よろしくお願いします!",
    pref: 13,
    parts: "12",
    portfolio: nil,
    status: "1",
    password: "session",
    email: "taro@session.jp",
    gender: "m",
    age: 22,
    admin: true
)

Member.create(
    name: "花子",
    birthday: "2000-03-09",
    profile: "こんにちは!",
    pref: 27,
    parts: "123",
    portfolio: nil,
    status: "2",
    password: "session",
    email: "hanako@session.jp",
    gender: "f",
    age: 22,
    admin: false,
)