<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Noitru;

/**
 * NoitruSearch represents the model behind the search form about `app\models\Noitru`.
 */
class NoitruSearch extends Noitru
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maBN', 'soPhong', 'soGiuong', 'ngayXuatVien'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Noitru::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'maBN' => $this->maBN,
            'soPhong' => $this->soPhong,
            'soGiuong' => $this->soGiuong,
            'ngayXuatVien' => $this->ngayXuatVien,
        ]);

        return $dataProvider;
    }
}
