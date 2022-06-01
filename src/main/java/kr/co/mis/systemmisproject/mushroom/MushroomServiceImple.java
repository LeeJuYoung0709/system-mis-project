package kr.co.mis.systemmisproject.mushroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MushroomServiceImple implements MushroomService {
    @Autowired
    private MushroomMapper mushroomMapper;

    @Override
    public Mushroom selectOne(Mushroom mushroom) {
        return mushroomMapper.selectOne(mushroom);
    }
}
