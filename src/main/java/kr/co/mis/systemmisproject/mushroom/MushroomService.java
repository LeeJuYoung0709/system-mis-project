package kr.co.mis.systemmisproject.mushroom;

import org.springframework.stereotype.Service;

@Service
public interface MushroomService {
    public Mushroom selectOne(Mushroom mushroom);
}
