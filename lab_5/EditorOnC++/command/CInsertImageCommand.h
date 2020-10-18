//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "CAbstractCommand.h"
#include "../document/CDocumentItem.h"
#include <optional>
#include <filesystem>

using namespace std;

class CInsertImageCommand : public CAbstractCommand
{
public:
    CInsertImageCommand(const filesystem::path& path, int width, int height, const filesystem::path& dirPath, vector<CDocumentItem>& items, optional<size_t> position = nullopt);
    ~CInsertImageCommand() override;

protected:
    void DoExecute() override;
    void DoUnexecute() override;

private:
    static shared_ptr<IImage> SaveImage(const filesystem::path& originalFilePath, const filesystem::path& imagesDirPath, int width, int height);

    vector<CDocumentItem>& m_items;
    optional<size_t> m_position;
    shared_ptr<IImage> m_image;
};
