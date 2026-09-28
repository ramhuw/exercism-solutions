#include "reverse_string.h"
#include <string>
#include <algorithm>

namespace reverse_string {

std::string reverse_string(std::string str) {
    std::string ans = str;
    std::reverse(ans.begin(), ans.end());
    return ans;
}

}  // namespace reverse_string
