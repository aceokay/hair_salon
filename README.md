# _Hair Salon_

##### _A simple Hair Salon Management System (HSMS), 8/21/2015_

#### By _**Austin Kincaid**_

## Description

_This simple Hair Salon Management System (HSMS) is capable of tracking Stylists and Clients within a hair salon database._

## Setup

* _Clone and set-up_
* _Be prepared to build a PG database to get this up and running_

## Database set_up

* _CREATE DATABASE hair_salon;_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_
* _CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_

## Technologies Used

_Postgres, Sinatra, Capybara, Rspec, Bootstrap, and Ruby_

### Legal

Copyright (c) 2015 **_Austin Kincaid_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
