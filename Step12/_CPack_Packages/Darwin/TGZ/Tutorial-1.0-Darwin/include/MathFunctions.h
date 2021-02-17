#if defined(_WIN32)
#   if defined(EXPROTING_MY_MATH)
#       define DECLSPEC __declspec(dllexport)
#   else
#       define DECLSPEC __declspec(dllimport)
#   endif
#else //non windows
#   define DECLSPEC
#endif

namespace mathfunctions {
    double DECLSPEC sqrt(double x);
}

