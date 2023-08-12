package com.viva.demo.dao;

import com.viva.demo.model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Component
public class JdbcUserDao implements UserDao {


    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int findIdByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        int userId;
        try {
            userId = jdbcTemplate.queryForObject("SELECT user_id FROM users WHERE username = ?", int.class, username);
        } catch (EmptyResultDataAccessException e) {
            throw new EmptyResultDataAccessException(1);
        } catch (NullPointerException e) {
            throw new NullPointerException("The user Id you're trying to find doesn't exist");
        }

        return userId;
    }

    @Override
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        if (results.next()) {
            return mapRowToUser(results);
        } else {
            return null;
        }
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public User findByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        for (User user : this.findAll()) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        throw new EmptyResultDataAccessException(1);
    }


    @Override
    public User create(User newUser) {
        String insertUserSql = "INSERT INTO users (username,password,role,name,address,city,state_code,zip) values (?,?,?,?,?,?,?,?) RETURNING user_id";


        int userId = jdbcTemplate.queryForObject(insertUserSql, int.class,
                newUser.getUsername(), newUser.getPassword(), newUser.getAuthoritiesString(), newUser.getName(), newUser.getAddress(),
                newUser.getCity(), newUser.getStateCode(), newUser.getZIP());
        return getUserById(userId);
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setAuthorities(Objects.requireNonNull(rs.getString("role")));
        user.setName(rs.getString("name"));
        user.setAddress(rs.getString("address"));
        user.setCity(rs.getString("city"));
        user.setStateCode(rs.getString("state_code"));
        user.setZIP(rs.getString("zip"));
        user.setActivated(true);
        return user;
    }


}
