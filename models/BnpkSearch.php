<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Bnpk;

/**
 * BnpkSearch represents the model behind the search form about `app\models\Bnpk`.
 */
class BnpkSearch extends Bnpk
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maBA', 'maPK'], 'integer'],
            [['ketQua', 'ngayKham'], 'safe'],
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
        $query = Bnpk::find();

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
            'maPK' => $this->maPK,
            'ngayKham' => $this->ngayKham,
        ]);

        $query->andFilterWhere(['like', 'ketQua', $this->ketQua]);

        return $dataProvider;
    }
}
