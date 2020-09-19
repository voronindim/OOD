//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "CCondimentDecorator.h"


class CCream: public CCondimentDecorator
{
public:
    CCream(IBeveragePtr&& beveragePtr)
        : CCondimentDecorator(std::move(beveragePtr))
    {
    }

    [[nodiscard]] double GetCondimentCost() const override
    {
        return 25;
    }

    [[nodiscard]] std::string GetCondimentDescription() const override
    {
        return "Cream";
    }
};