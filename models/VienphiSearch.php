<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Vienphi;

/**
 * VienphiSearch represents the model behind the search form about `app\models\Vienphi`.
 */
class VienphiSearch extends Vienphi
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maBA', 'tien', 'ngayDongVP'], 'integer'],
            [['mota'], 'safe'],
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
        $query = Vienphi::find();

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
            'maBA' => $this->maBA,
            'tien' => $this->tien,
            'ngayDongVP' => $this->ngayDongVP,
        ]);

        $query->andFilterWhere(['like', 'mota', $this->mota]);

        return $dataProvider;
    }
}
