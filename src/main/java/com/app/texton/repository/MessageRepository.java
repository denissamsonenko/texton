package com.app.texton.repository;

import com.app.texton.model.Message;
import com.app.texton.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface MessageRepository extends CrudRepository<Message, Long> {

    Page<Message> findByTag(String tag, Pageable pageable);

    Page<Message> findAll(Pageable pageable);

    // language HQL
    @Query("from Message m where m.author= :author")
    Page<Message> findByUser(Pageable pageable, @Param("author") User author);
}
