package com.app.texton.service;

import com.app.texton.model.Role;
import com.app.texton.model.User;
import com.app.texton.repository.UserRepository;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collections;

import static org.mockito.Mockito.doReturn;

@SpringBootTest
class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private MailSender mailSender;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @Test
    void addUser() {
        User user = new User();
        user.setEmail("some@mail.ru");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertTrue(isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));

        Mockito.verify(userRepository, Mockito.times(1)).save(user);
        Mockito.verify(mailSender, Mockito.times(1)).send(
                ArgumentMatchers.eq(user.getEmail()),
                ArgumentMatchers.eq("Activation code"),
                ArgumentMatchers.contains("Hello,"));
        //if message will be different replace ArgumentMatchers.anyString()
    }

    @Test
    public void addUserFailTest() {
        User user = new User();
        user.setUsername("Ivan");

        doReturn(new User())
                .when(userRepository)
                .findByUsername("Ivan");

        boolean isUserCreated = userService.addUser(user);

        Assert.assertFalse(isUserCreated);

        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
        Mockito.verify(mailSender, Mockito.times(0)).send(
                ArgumentMatchers.anyString(),
                ArgumentMatchers.anyString(),
                ArgumentMatchers.anyString());
    }

    @Test
    public void activateUser() {
        User user = new User();
        user.setActivationCode("someCode");

        doReturn(user)
                .when(userRepository)
                .findByActivationCode("activate");

        boolean activate = userService.activateUser("activate");

        Assert.assertTrue(activate);
        Assert.assertNull(user.getActivationCode());
        Mockito.verify(userRepository, Mockito.times(1)).save(user);
    }

    @Test
    public void activationUserFailTest() {
        boolean activate = userService.activateUser("activate no");

        Assert.assertFalse(activate);

        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
    }
}