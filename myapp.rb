# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'erb'
require File.dirname(__FILE__) + "/lib/originCal"

helpers do
  include Rack::Utils; alias_method :h, :escape_html
end

template :layout do
 "<html><body><h1>Hello World</h1><%= yield %></body></html>"
end

get '/' do
  erb %{
    <p>2012年の何月のカレンダーを見る？</p>
    <form action="/month" method="get">
    <select name="selectMonth">
    <% (1..12).each do |month| %>
    <option value="<%= month %>"><%= month %></option>
    <% end %>
    </select>
    <input type="submit" value="表示">
    </form>
  }
end

get '/month' do
  @my_calendar = Calendar.new
  erb:calendar
end

not_found do 
  'file not found.'
end
