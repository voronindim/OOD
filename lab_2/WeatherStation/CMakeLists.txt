cmake_minimum_required(VERSION 3.16)
project(WeatherStation)

set(CMAKE_CXX_STANDARD 20)

add_executable(WeatherStation main.cpp WeatherData.h Observer.h)