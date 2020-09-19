//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include <iostream>

class IBeverage
{
public:
    [[nodiscard]] virtual std::string GetDescription() const = 0;
    [[nodiscard]] virtual double GetCost() const = 0;
    virtual ~IBeverage() = default;
};

typedef std::unique_ptr<IBeverage> IBeveragePtr;