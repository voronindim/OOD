//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include <string>
#include <vector>
#include "document/CDocumentItem.h"

using namespace std;

string GetHtmlString(const string& str);

void SaveToHtmlFunction(const string& path, const string& title, const vector<CDocumentItem>& items);
