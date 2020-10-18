//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include <memory>

class ICommand
{
public:
    virtual void Execute() = 0;
    virtual void Unexecute() = 0;

    virtual ~ICommand() = default;
};

typedef std::unique_ptr<ICommand> ICommandPtr;
