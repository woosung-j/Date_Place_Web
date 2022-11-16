package com.my.date.util;

import javax.servlet.http.HttpSession;

public class SessionUtil {
    private static final String USER_ID = "userId";
    private static final String IS_ADMIN = "isAdmin";

    private SessionUtil() {}

    public static int getLoginUserId(HttpSession session) {
        if(session == null || session.getAttribute(USER_ID) == null) {
            return -1;
        }
        return (int) session.getAttribute(USER_ID);
    }

    public static boolean getIsAdmin(HttpSession session) {
        if(session == null || session.getAttribute(IS_ADMIN) == null) {
            return false;
        }
        return (boolean) session.getAttribute(IS_ADMIN);
    }
}
