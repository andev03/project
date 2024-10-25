package com.hoangan.securityproject.repository;

import com.hoangan.securityproject.pojos.Accounts;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends CrudRepository<Accounts, Long> {
    Accounts findByCustomerId(long customerId);
}
