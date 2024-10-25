package com.hoangan.securityproject.repository;

import com.hoangan.securityproject.pojos.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends CrudRepository<Contact, String> {
}
