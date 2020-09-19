//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "IBeverage.h"

class CCondimentDecorator: public IBeverage
{
public:
    [[nodiscard]] std::string GetDescription() const override
    {
        return m_beverage->GetDescription() + ", " + GetCondimentDescription();
    }

    [[nodiscard]] double GetCost() const override
    {
        return m_beverage->GetCost() + GetCondimentCost();
    }

    [[nodiscard]] virtual std::string GetCondimentDescription() const = 0;
    [[nodiscard]] virtual double GetCondimentCost() const = 0;

protected:
    CCondimentDecorator(IBeveragePtr&& beveragePtr)
        : m_beverage(std::move(beveragePtr))
    {
    }

private:
    IBeveragePtr m_beverage;
};