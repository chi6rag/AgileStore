# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(title: 'Programming Ruby 1.9 & 2.0',
								description: %{<p>
								Ruby is the fastest growing and most exciting dynamic language
								out there. If you need to get working programs delivered fast,
								you should add Ruby to your toolbox.
								</p>},
								image_url: 'http://ecx.images-amazon.com/images/I/4120975FZML.jpg',
								price: 49.95)

Product.create!(title: 'Rework',
								description: %{<p>
								Rework shows you a better, faster, easier way to succeed in business.
								Read it and you'll know why plans are actually harmful, why you don't
								need outside investors, and why you're better off ignoring the competition.
								The truth is, you need less than you think. You don't need to be a workaholic.
								You don't need to staff up. You don't need to waste time on paperwork or
								meetings. You don't even need an office. Those are all just excuses. 
								</p>},
								image_url: 'https://d.gr-assets.com/books/1391275636l/6732019.jpg',
								price: 59.99)

Product.create!(title: 'Crafting Rails 4 Applications',
								description: %{<p>
								Get ready to see Rails as you've never seen it before. Learn how to extend
								the framework, change its behavior, and replace whole components to bend it
								to your will. Eight different test-driven tutorials will help you understand
								Rails' inner workings and prepare you to tackle complicated projects with
								solutions that are well-tested, modular, and easy to maintain.
								</p>},
								image_url: 'https://d.gr-assets.com/books/1372784866l/18051754.jpg',
								price: 99.99)