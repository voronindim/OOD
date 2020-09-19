cmake_minimum_required(VERSION 3.16)
project(Task_1)

set(CMAKE_CXX_STANDARD 20)

add_executable(Task_1 main.cpp IBeverage.h Beverage.h CCoffee.h CMilkshake.h CTea.h Cream.h CCondimentDecorator.h CChocolate.h CLiquor.h TestBeverages.cpp TestCondimects.cpp)