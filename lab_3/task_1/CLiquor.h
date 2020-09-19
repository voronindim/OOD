//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "CCondimentDecorator.h"

enum class LiquorType
{
    Nut,
    Chocolate
};

class CLiquor: public CCondimentDecorator
{
public:
    CLiquor(IBeveragePtr&& beveragePtr, LiquorType liquorType)
        : CCondimentDecorator(std::move(beveragePtr))
        , m_liquorType(liquorType)
    {
    }

    [[nodiscard]] double GetCondimentCost() const override
    {
        return 50;
    }

    [[nodiscard]] std::string GetCondimentDescription() const override
    {
        return std::string(m_liquorType == LiquorType::Nut ? "Nut" : "Chocolate") + " Liquor";
    }

private:
    LiquorType m_liquorType;
};
