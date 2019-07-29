package Item.service;


import Item.entity.Loss;

import java.util.List;

public interface CustomerLossService {
    List<Loss> search(Loss loss);
}
