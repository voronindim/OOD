cmake_minimum_required(VERSION 3.16)
project(Streams)

set(CMAKE_CXX_STANDARD 20)

add_executable(Streams main.cpp IInputDataStream.h InputStreamDecorators.h Chunk.h OutputStreams.h OutputStreamsDecorator.h)