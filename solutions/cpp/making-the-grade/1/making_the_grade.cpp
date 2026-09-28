#include <array>
#include <string>
#include <vector>
#include <cmath>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores)
{
    std::vector<int> ans{};
    for (auto x : student_scores)
    {
        ans.push_back(std::floor(x));
    }
    return ans;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores)
{
    auto ans = 0;
    for (auto x : student_scores)
    {
        if (x <= 40)
        {
            ans += 1;
        }
    }
    return ans;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score)
{
    auto x = (highest_score - 40) / 4;
    auto a = 41;
    auto b = a + x;
    auto c = b + x;
    auto d = c + x;
    return std::array<int, 4>{a, b, c, d};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names)
{
    std::vector<std::string> ans{};
    for (auto i = 1; i <= student_scores.size(); i++)
    {
        ans.push_back(std::to_string(i) + ". " + student_names[i - 1] + ": " + std::to_string(student_scores[i - 1]));
    }
    return ans;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names)
{
    for (auto i = 0; i < student_scores.size(); i++)
    {
        if (student_scores[i] == 100)
        {
            return student_names[i];
        }
    }
    return "";
}
