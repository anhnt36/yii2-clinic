<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Phongkham;

/**
 * PhongkhamSearch represents the model behind the search form about `app\models\Phongkham`.
 */
class PhongkhamSearch extends Phongkham
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maKhoa'], 'integer'],
            [['tenPK', 'moTa'], 'safe'],
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
        $query = Phongkham::find();

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
            'maKhoa' => $this->maKhoa,
        ]);

        $query->andFilterWhere(['like', 'tenPK', $this->tenPK])
            ->andFilterWhere(['like', 'moTa', $this->moTa]);

        return $dataProvider;
    }
}
