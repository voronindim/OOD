//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "CCondimentDecorator.h"

const unsigned MAX_SLICE = 5;

class CChocolate: public CCondimentDecorator
{
public:
    CChocolate(IBeveragePtr&& beveragePtr, unsigned slice = 1)
        : CCondimentDecorator(std::move(beveragePtr))
        , m_slices(slice)
    {
        if (slice > MAX_SLICE)
        {
            m_slices = MAX_SLICE;
        }
    }

    [[nodiscard]] double GetCondimentCost() const override
    {
        return 10 * m_slices;
    }

    [[nodiscard]] std::string GetCondimentDescription() const override
    {
        return "Chocolate " + std::to_string(m_slices) + " slices";
    }

private:
    unsigned m_slices;
};