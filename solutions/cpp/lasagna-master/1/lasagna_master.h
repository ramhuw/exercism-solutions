#pragma once
#include <vector>
#include <string>
namespace lasagna_master
{

    struct amount
    {
        int noodles;
        double sauce;
    };

    int preparationTime(const std::vector<std::string> &layers, int min);
    int preparationTime(const std::vector<std::string> &layers);

    amount quantities(const std::vector<std::string> &layers);

    void addSecretIngredient(std::vector<std::string> &myList, const std::vector<std::string> &friendsList);

    void addSecretIngredient(std::vector<std::string> &myList, std::string s);

    std::vector<double> scaleRecipe(std::vector<double> quantities, int p);
} // namespace lasagna_master
