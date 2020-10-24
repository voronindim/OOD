//
// Created by Dmitrii Voronin on 19.10.2020.
//
#pragma once
#include <cstdint>

struct Chunk
{
    uint8_t numberOfBytes = 0;
    uint8_t byte{};

    void Reset()
    {
        numberOfBytes = 0;
    }

    [[nodiscard]] bool IsEmpty() const
    {
        return numberOfBytes == 0;
    }
};
