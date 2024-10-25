package com.hoangan.securityproject.repository;

import com.hoangan.securityproject.pojos.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

    @Query(value = "Select nt From Notice nt")
    List<Notice> findAllActiveNotices();

}
