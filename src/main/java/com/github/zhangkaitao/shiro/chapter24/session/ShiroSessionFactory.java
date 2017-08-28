package com.github.zhangkaitao.shiro.chapter24.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;

public class ShiroSessionFactory implements SessionFactory {

    @Override
    public Session createSession(SessionContext initData) {
        ShiroSession session = new ShiroSession();
        return session;
    }
}
