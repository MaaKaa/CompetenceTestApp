package pl.marzenakaa.app.organisation;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class OrganisationService {
    //Wszelka logika biznesowa - nie powinniśmy jej implementować w contollerze.
    //Do contollerów powinniśmy tylko wstrzykiwać Service - nie powinniśmy w nich bezpośrednio korzystać z repository.
    //Controller może korzystać z kilku serwisów.
}
