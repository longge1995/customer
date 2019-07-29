package Item.mapper;


import Item.entity.Loss;

import java.util.List;

public interface CustomerLossMapper {
    List<Loss> search(Loss loss);
}
