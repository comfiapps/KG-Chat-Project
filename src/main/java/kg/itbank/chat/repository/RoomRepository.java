package kg.itbank.chat.repository;

import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

public interface RoomRepository extends JpaRepository<Room, Long> {

    List<Room> findAllByOwnerIdOrOpponentIdOrderByCreateDateDesc(long owner, long opponent);

    boolean existsByOpponentId(long id);

    @Query(value = "select * from (select * from Room where (userId = ?1 or opponentId = ?1) and closeDate is null) r where endTime > current_timestamp or endTime is null", nativeQuery = true)
    Room findDebatingRoom(long owner);

    @Query(value = "delete from Room where id = ?1 and userId =?2", nativeQuery = true)
    @Modifying
    @Transactional
    int deleteRoom(long id, long userId);

    List<Room> findAllByOpponentIdOrderByCreateDateDesc(long id);



    @Query(value = "SELECT category FROM Room GROUP BY category", nativeQuery = true)
    List<String> listAllCategories();

    @Query(value = "SELECT category FROM Room WHERE opponentId = 0 GROUP BY category", nativeQuery = true)
    List<String> listWaitCategories();

    @Query(value = "SELECT category FROM (select * from Room where (userId > 0 and opponentId > 0) and closeDate is null) r where endTime > current_timestamp or endTime is null GROUP BY category", nativeQuery = true)
    List<String> listOnGoingCategories();

    @Query(value = "select category from Room where closeDate is not null or endTime <= current_timestamp GROUP BY category", nativeQuery = true)
    List<String> listDoneCategories();

    List<Room> findTop8ByCategoryAndOpponentId(String category, long id);

    @Query(value = "SELECT * FROM (select * from Room where (userId > 0 and opponentId > 0) and closeDate is null) r where category = ?1 and endTime > current_timestamp or endTime is null LIMIT 8", nativeQuery = true)
    List<Room> findTop8OnGoingByCategory(String category);

    @Query(value = "SELECT * FROM (select * from Room where closeDate is not null or endTime <= current_timestamp) r where category = ?1 LIMIT 8", nativeQuery = true)
    List<Room> findTop8DoneByCategory(String category);

    List<Room> findByNameIsContainingOrCategoryContainingOrOwnerNameContaining(String name, String category, String owner);

    /*
    @Query(value = "SELECT category, projectName FROM projects", nativeQuery = true)
    public List<Room> ();*/
}
